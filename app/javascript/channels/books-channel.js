import consumer from "./consumer";

const initBooksCable = () => {
  const books = document.getElementById('books-container');
  if (books) {
    consumer.subscriptions.create({ channel: "BooksChannel" }, {
      received(data) {
        const book = document.getElementById(`card-book-${data.id}`)
        if(book) {
          book.remove()
        }
      },
    });
  }
}

export { initBooksCable };