import consumer from "./consumer";

const initBooksCable = () => {
  consumer.subscriptions.create({ channel: "BooksChannel" }, {
    received(data) {
      const indexBook = document.getElementById(`card-book-${data.id}`)
      if (indexBook) {
        indexBook.remove()
      }
      const showBook = document.getElementById(`show-card-book-${data.id}`)
      if (showBook) {
        const form = document.getElementById('new_cart_element')
        if (form) {
          form.insertAdjacentHTML('afterend', '<div class="text-center">We are sorry but this book is no longer available..</div>')
          form.remove()
        }
      }
    },
  });
}

export { initBooksCable };