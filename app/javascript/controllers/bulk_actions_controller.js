import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "selected" ]
  static targets = [ "row", "checkbox", "selectedIdsField", "menu" ]
  static values = { selectedCount: Number, selectedIds: String }  

  update(e) {
    this.refreshSelection()
  }

  reset() {
    this.selectedCountValue = 0
    this.selectedIdsValue = ''
  }

  refreshSelection() {
    let newCount = 0
    let newIds = ''
    this.checkboxTargets.forEach((cb) => {
      if (cb.checked) {
        newCount++
        newIds = newIds.length ? newIds.concat(',', cb.dataset.topicId) : cb.dataset.topicId
      }
    })
    this.selectedCountValue = newCount
    this.selectedIdsValue = newIds
  }

  selectedCountValueChanged(newCount) {
    this.selectedCountValue ? this.addClassesAndAttrs() : this.removeClassesAndAttrs()
    // console.log('selectedCountValue:', this.selectedCountValue)
  }

  selectedIdsValueChanged(newString) {
    this.selectedIdsFieldTargets.forEach((field) => field.value = newString)
  }

  addClassesAndAttrs() {
    this.element.classList.add(this.selectedClass)
    this.menuTarget.setAttribute('open', '')
  }

  removeClassesAndAttrs() {
    this.element.classList.remove(this.selectedClass)
    this.menuTarget.removeAttribute('open')
  }
}