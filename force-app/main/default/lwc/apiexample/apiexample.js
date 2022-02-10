import { LightningElement, api } from 'lwc';
import Test from '@salesforce/apex/AccountRecord.Test';
export default class apiexample extends LightningElement {
@api lastname;
@api email;
@api phone;

handleSave(event) {
    Test({LastName:this.lastname,Email:this.email,Phone:this.phone})
    .then(result => {


  
  })
  .catch(error => {
  
  });
}
firstAction(event){
this.lastname = event.target.value;
console.log('Test'+event.target.value);
}
emailAction(event){
this.email = event.target.value;
console.log('Test2'+event.target.value);
}
phoneAction(event){
this.phone = event.target.value;
console.log('Test3'+event.target.value);
}
}