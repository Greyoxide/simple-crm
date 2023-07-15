import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tabs"
export default class extends Controller {
  connect() {
    // gotta set the active tab if one is present

    const tabsContainer = this.element
    let container = this.element
    let activePanel = container.querySelector('.panel.is-active')
    if (typeof variable === 'undefined' || activePanel === null) {
    //   in this case we have to set an active tab and active panel, because one isn't defined.
      let panel = container.querySelector('.panel')
      let tab = container.querySelector('.tab')

      panel.classList.add('is-active')
      tab.classList.add('is-active')
    }else{
    //   in this case there is a panel thats active so we have to make the tab active also.
    }
  }

  setTab(event) {
    let tab = event.currentTarget
    let container = this.element
    let tabs = container.querySelector('.tabs')
    let panels = container.querySelectorAll('.panel')

    let activeElements = container.querySelectorAll('.is-active')
    activeElements.forEach(element => {
      element.classList.remove('is-active');
    })

    let position = Array.from(tabs.children).indexOf(tab.parentElement);
    console.log(panels)

    tab.classList.add('is-active')
    panels[position].classList.add('is-active')
  }
}