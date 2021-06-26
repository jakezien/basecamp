import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "flyout" ]
  static values = { isOpen: Boolean }

  toggle() {
    this.isOpenValue = !this.isOpenValue
  }

  isOpenValueChanged(newValue) {
    newValue ? this.show() : this.hide()
  }

  show() {
    this.flyoutTarget.setAttribute('open', '')
  }

  hide() {
    this.flyoutTarget.removeAttribute('open')
  }
}