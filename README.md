# ERC20 CROWD FUNDING SMART-CONTRACT


### Contract Requirements
```
1. Contract Manager Can Create Campaigns.
2. Funders/Contributers can transfer amount to contract.
3. Funders can't whitdraw amount if time does'nt end.
4. Funders can whitdraw amount if time will be end but targetedAmount does'nt match.
5. If voter is not funder, then voter can't give vote.
6. No one can give more than one time vote.
7. When a campaign ends, the manager can claim the funds.
8. Funds transfer that campaign where voters will be more that 50% funders/contributers.
```


#### Contract Explanation


##### 1. State Variables

- Address of manager is equal to deployer address. 
- numCampaigns are showing that, how many campaigns have been created.
- timeDeadline is showing that which time campaign will be end.
- raisedAmount are showing that how much amount have been deposited in contract.
- targetedAmount are showing that how much amount have required.
- numOfContributors are showing that how many users have deposited amount in contract.
- minimumContribution are showing that how much amount must deposit.


##### 2. Struct

- Struct of CreateCampaign store data of campaign.


##### 3. Mappings

- Campaigns mapping show data of campaign.
- contributors mapping show, how much amount have deposited from input address.


##### 4. Constructor

11. - constructor set targetedAmount and timeDeadline.


##### 5. Modifier

12. - Modifier of onlyManger set the address of modifier is equal to msg.sender. 


##### 6. Functions

13. - sendAmount function send the amount to campaign with check conditions.

14. - getContractBalance show the total balance of contract.

15. - refund function, refund the amount with check the conditions.

16. - createCampaign function can only call the contract managera and that function set campaign data.

17. - voteToCampaign functions give votes to campaign.

18. - ClaimFunds function claim the amount of campaign, but when the campaign will be end and targeted value also met.
