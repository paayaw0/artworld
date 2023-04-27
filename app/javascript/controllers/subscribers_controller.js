import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    countdown: String
  }

  countdownDate(countdown, output) {
    let setDate = this.countdownValue;
    let timeleft = new Date(setDate).getTime() - new Date().getTime();
    let days = Math.floor(timeleft / (1000 * 60 * 60 * 24));
    let hours = Math.floor((timeleft % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    let minutes = Math.floor((timeleft % (1000 * 60 * 60)) / (1000 * 60));
    let seconds = Math.floor((timeleft % (1000 * 60)) / 1000);

    countdown.innerHTML = output.replace('%d', days).replace('%h', hours).replace('%m', minutes).replace('%s', seconds);
  }

  connect() {
    let countdown = document.querySelector('.countdown');
    const output = countdown.innerHTML;
    this.countdownDate(countdown, output);
    
    setInterval(() => {
      this.countdownDate(countdown, output);
    }, 1000);
  }
}
