import { LightningElement ,track} from 'lwc';
export default class trackexample extends LightningElement {
 fname = "Farukh Haider";

  handleChange(event) {

      this.fname = event.target.value;

      console.log('Name change ' + this.fname);

  }
}