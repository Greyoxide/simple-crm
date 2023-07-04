import { Controller } from "@hotwired/stimulus"
import { animateCSS } from "../animate.js"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    const container = this.element
    
    animateCSS(container, 'zoomIn')
    container.showModal()
  }
  
  close() {
    const container = this.element
    
    animateCSS(container, 'zoomOut').then(() => {
      container.close()
    })
  }
}