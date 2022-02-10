import { LightningElement, api} from 'lwc';
import NAME_FIELD from '@salesforce/schema/Contact';

export default class EditForms extends LightningElement {
    @api recordId;
    handleSubmit(event) {
        console.log('onsubmit event recordEditForm'+ event.detail.fields);
    }
    handleSuccess(event) {
        console.log('onsuccess event recordEditForm', event.detail.id);
    }
}