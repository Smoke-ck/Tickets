import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="turbomodal"
export default class extends Controller {
  connect() {
    blurBackground()
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }

  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
    blurBackground()
  }
}

function blurBackground() {
  document.getElementById('modal').classList.toggle('modal--blur')
}
