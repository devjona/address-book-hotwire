import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["value"];

  greet() {
    console.log("this: ", this);
    // From this: <input data-hello-target="value"
    // Naming convention: "value" + target:
    const element = this.valueTarget;
    const name = element.value;
    console.log(`Hello, ${name}!`);
  }
}
