import { Controller } from "stimulus"

export default class extends Controller {
  static classes = [ "selected" ]
  static targets = [ "row", "checkbox" ]
  static values = { selectedCount: Number }  

  update(e) {
    console.log(e.target.dataset.topicId)
    let count = 0;
    this.checkboxTargets.forEach((cb) => {
      if (cb.checked) count++;
    })
    this.selectedCount = count;

    this.selectedCount ? 
      this.element.classList.add(this.selectedClass) :
      this.element.classList.remove(this.selectedClass)

    console.log(this.selectedCount)
  }

}