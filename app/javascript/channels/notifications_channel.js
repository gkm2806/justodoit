import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    let p = document.createElement("p")
    let text = document.createTextNode(data.html)
    p.appendChild(text);
    document.querySelector(".notification-box").appendChild(p)
  }
});
