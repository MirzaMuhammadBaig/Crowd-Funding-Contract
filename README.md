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

1. - Address of manager is equal to deployer address. 
2. - numCampaigns are showing that, how many campaigns have been created.
3. - timeDeadline is showing that which time campaign will be end.
4. - raisedAmount are showing that how much amount have been deposited in contract.
5. - targetedAmount are showing that how much amount have required.
6. - numOfContributors are showing that how many users have deposited amount in contract.
7. - minimumContribution are showing that how much amount must deposit.


8. - Struct of CreateCampaign store data of campaign.
9. - Campaigns mapping show data of campaign.
10. - contributors mapping show, how much amount have deposited from input address.


11. - constructor set targetedAmount and timeDeadline.


12. - Modifier of onlyManger set the address of modifier is equal to msg.sender. 


13. - sendAmount function send the amount to campaign with check conditions.


14. - getContractBalance show the total balance of contract.


15. - refund function, refund the amount with check the conditions.


16. - createCampaign function can only call the contract managera and that function set campaign data.

17. - voteToCampaign functions give votes to campaign.


18. - ClaimFunds function claim the amount of campaign, but when the campaign will be end and targeted value also met.