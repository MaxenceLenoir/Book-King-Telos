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
        const button = document.getElementById('button-add-cart')
        button.insertAdjacentHTML('afterend', 'We are sorry but this book is no longer available..')
        button.remove()
      }
    },
  });
}

export { initBooksCable };