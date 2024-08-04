# Soft Me Wallet

Soft Me Wallet is a mobile application developed using Flutter and Dart, utilizing Riverpod for state management. The app serves as a user input and output controller, allowing users to manage their financial transactions with ease. 

## Description

Soft Me Wallet enables users to register, log in, and manage their financial inputs and outputs. Users can also create, update, and delete categories and transactions. The app provides statistical views and supports exporting data to an Excel file.

## Features

1. **Authentication**
   - Register
   - Login

2. **Avatar Management**
   - Create or Update
   - Delete

3. **Category Management**
   - View Categories
   - Create Category
   - Update Category
   - Delete Category

4. **Transaction Management**
   - View Transactions
   - Create Transaction
   - Show Transaction
   - Update Transaction
   - Delete Transaction
   - View Statistics (Weekly, Monthly, Annual)
   - Export Transactions to Excel

## API Documentation

The app interacts with various APIs to manage user data, categories, and transactions. For detailed API documentation, refer to the following link:
[Atomic API Documentation](https://online.atomic.uz/api/documentation#/)

You can also use Postman to view the API requests and responses.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/soft-me-wallet.git
   ```

2. Navigate to the project directory:
   ```bash
   cd soft-me-wallet
   ```

3. Install the dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Usage

1. **Register**: Users must register with a username and password.
2. **Login**: Users must log in with their registered username and password.
3. **Guest Access**: Users can use the app without logging in to view and fill in data (Categories, Transactions).
4. **Avatar Management**: Users can upload, change, and delete their profile pictures.
5. **Category Management**: Users can create, delete, and edit categories. The balance is updated during these processes.
6. **Transaction Management**: Users can create inputs or outputs by selecting a category. They can also edit and delete transactions.
7. **View Transactions**: Users can view their inputs and outputs.
8. **Statistics**: Users can view statistics by category on a weekly, monthly, and annual basis.
9. **Export Data**: Users can export their input and output data to an Excel file.

## Example App

For an example of similar functionality, you can check out the following app:
[Money Manager](https://play.google.com/store/apps/details?id=com.freeman.moneymanager)

## Order of Work

1. User registration with username and password.
2. User login with registered username and password.
3. Guest access for viewing and filling in data without logging in.
4. Avatar management for uploading, changing, and deleting profile pictures.
5. Category management for creating, deleting, and editing categories.
6. Transaction management for creating inputs or outputs and selecting their categories.
7. Viewing, editing, and deleting transactions.
8. Viewing input and output data.
9. Viewing statistics by category on a weekly, monthly, and annual basis.
10. Exporting input and output data to an Excel file.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for review.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to customize it further based on your specific needs.
