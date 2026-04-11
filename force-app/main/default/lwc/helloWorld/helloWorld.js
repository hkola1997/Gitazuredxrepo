import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {
    message = 'Welcome to Salesforce LWC!';

    handleClick() {
        this.message = 'Button clicked 🎉';
    }
}