import { LightningElement ,api,wire} from 'lwc';

import getOpportunityPageLayout from '@salesforce/apex/newlwcAssign.getOpportunityPageLayout';
import getLeadLayout from '@salesforce/apex/newlwcAssign.getLeadLayout';
import getRecordId from '@salesforce/apex/newlwcAssign.getRecordId';

export default class LwcAssignment extends LightningElement {
    
    @api recordId;
    @api Opportunity;
    @api recordId3;
    error

    @wire(getOpportunityPageLayout,{ })
    opp;

    @wire(getLeadLayout,{})
    leads;

    @wire (getRecordId,{recordId:'$recordId'})
    recordId2({ error, data }) {
        if (data) {
            this.recordId3 = data;
            console.log('RecordId'+this.recordId3);
        } else if (error) {
            this.error = error;
        }
    }
}