//SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract CrowdFunding{

    address public manager; 
    uint public numCampaigns;
    uint public timeDeadline;
    uint public raisedAmount;
    uint public targetedAmount;
    uint public numOfContributors;
    uint public minimumContribution;
    
    struct CreateCampaign{
        bool completed;
        uint numOfVoters;
        uint neededAmount;
        string description;
        address payable recipient;
        mapping(address => bool) voters;
    }

    mapping(uint => CreateCampaign) public Campaigns;
    mapping(address => uint) public contributors;

    constructor(uint _targetedAmount,uint _timeDeadline){
        manager = msg.sender;
        targetedAmount = _targetedAmount;
        minimumContribution = 0.2 ether;
        timeDeadline = block.timestamp + _timeDeadline;
    }
    
    modifier onlyManger(){
        require(msg.sender == manager,"Only manager can call this function");
        _;
    }

    function sendAmount() public payable{
        require(block.timestamp < timeDeadline,"Deadline has passed");
        require(msg.value >= minimumContribution,"Minimum Contribution is not met");
        
        if(contributors[msg.sender] == 0){
            numOfContributors++;
        }

        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function refund() public{
        require(block.timestamp>timeDeadline && raisedAmount<targetedAmount,"You are not eligible for refund");
        require(contributors[msg.sender] > 0);
        address payable user = payable(msg.sender);
        user.transfer(contributors[msg.sender]);
        contributors[msg.sender] = 0;    
    }

    function createCampaign(string memory _description,address payable _recipient,uint _value) public onlyManger{
        CreateCampaign storage newCampaign = Campaigns[numCampaigns];
        numCampaigns++;
        newCampaign.description = _description;
        newCampaign.recipient = _recipient;
        newCampaign.neededAmount = _value;
        newCampaign.completed = false;
        newCampaign.numOfVoters = 0;
    }

    function voteToCampaign(uint CampaignNum) public{
        require(contributors[msg.sender] > 0,"You must be contributor");
        CreateCampaign storage thisCampaign = Campaigns[CampaignNum];
        require(thisCampaign.voters[msg.sender] == false,"You have already voted");
        thisCampaign.voters[msg.sender] = true;
        thisCampaign.numOfVoters++;
    }

    function ClaimFunds(uint CampaignNum) public onlyManger{
        require(raisedAmount >= targetedAmount);
        CreateCampaign storage thisCampaign = Campaigns[CampaignNum];
        require(thisCampaign.completed == false,"Request has been completed");
        require(thisCampaign.numOfVoters > numOfContributors/2,"Majority does not support");
        thisCampaign.recipient.transfer(thisCampaign.neededAmount);
        thisCampaign.completed = true;
    }

}
