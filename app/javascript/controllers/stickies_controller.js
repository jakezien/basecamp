import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "textField", "checkbox" ]
  static values = { isOpen: Boolean, body: String }

  toggle() {
    this.isOpenValue = !this.isOpenValue
  }

  reset() {
    this.textFieldTarget.value = this.bodyValue
    this.toggle()
  }

  isOpenValueChanged(newValue) {
    newValue ? this.show() : this.hide()
  }

  show() {
    this.bodyValue = this.textFieldTarget.value;
    this.element.setAttribute('open', '')
    this.textFieldTarget.focus();
  }

  hide() {
    this.element.removeAttribute('open')
  }

  checkDestroy() {
    this.checkboxTarget.checked = true;
  }
}