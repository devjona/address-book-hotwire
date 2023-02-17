import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "phone",
    "phoneTemplate",
    "email",
    "emailTemplate",
    "address",
    "addressTemplate",
  ];
  static values = {
    wrapperSelector: {
      type: String,
      default: ".nested-form-wrapper",
    },
  };

  connect() {
    console.log("targets: ", this.targets);
  }

  add(e) {
    e.preventDefault();
    const fieldScope = e.target.dataset.fieldScope;
    const scopedTarget = this[`${fieldScope}Target`];
    const scopedTemplate = this[`${fieldScope}TemplateTarget`];

    // 1. The template is updated with a unique identifier
    const content = scopedTemplate.innerHTML.replace(
      /NEW_RECORD/g,
      new Date().getTime().toString()
    );
    // 2. The template is inserted into the DOM
    scopedTarget.insertAdjacentHTML("beforebegin", content);
  }

  remove(e) {
    e.preventDefault();

    // This should work fine because the wrapper is the closest parent
    const wrapper = e.target.closest(this.wrapperSelectorValue);

    if (wrapper.dataset.newRecord === "true") {
      wrapper.remove();
    } else {
      wrapper.style.display = "none";

      const input = wrapper.querySelector("input[name*='_destroy']");
      input.value = "1";
    }
  }
}
