import { LightningElement } from 'lwc';

export default class GreetingApp extends LightningElement {
    name = 'User';

    handleChange(event) {
        this.name = event.target.value;
    }
}