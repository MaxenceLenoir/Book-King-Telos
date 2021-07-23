# How this webapp works

  After seeding the database you can launch the app `rails server` and go to localhost:3000.
  You will be able to connect, or to create account for both seller or buyer.

## Seller

  create an account
   - First Name
   - Last Name
   - Email
   - Address
   - Password


  #### Feature Books Index Page
   - Search Bar (No reload)
   - Click a book card to acces its show
   - Link to create a book
     + Title
     + Description
     + Author
     + Price

  After the creation, you'll see a **$1** difference with the price you entered, that's **Book-King fees**.


  #### Feature Book Show Page
   - Display all information (Information creation + seller)
   - **destroy and edit** a book if :
     1. **Your are the seller**
     2. **Your book is available (eg: it isn't currently in a customer's cart and it hasn't been sold)**


  #### Feature Dashboard
   - earnings visualisation
   - list of your book with different tags 
      + Sold
      + In a cart
      + In stock



## Buyer

  create an acoount
   - First Name
   - Last Name
   - Email
   - Phone
   - Password

  #### Feature Books Index Page
   - Search Bar (No reload)
   - Click a book card to acces its show

  #### Feature Book Show Page
   - Display all information (Information creation + seller)
   - "Add to cart" if **book available**

   Clicking the "add to cart" button have consequences for yourself :
   1. Increment the notification cart counter by 1
   2. Button disappear
   3. New text appear "We are sorry but this book is no longer available".
   
 **BUT**, it also changes other users interface :
   
   5. If a user were on the same page, he would see the button disappear and the text appear in real time.
   6. If a user were on the index page, he would see the book disappear from the books's list.
   All this actions don't require a page relaod
   
 #### Feature Cart Show Page
  - List of the book in the cart (Delete from the cart by clicking on the trash)
  - Total price
  - Pay button *(whether it's i. or ii. case, your cart will be emptied)*
     1. You have enough money and your buy is confirmed.
     2. You don't have enough money and your buy is canceled.
  
  *If you don't have enough money on your account, a warning appears on this page.*

 #### Feature Profile Show Page
  - See information (basics / money on your account / list books bought)
  - Edit your information
