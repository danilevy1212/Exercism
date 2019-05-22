import threading

class BankAccount(object):
    account_not_open_exception = ValueError("Account is not open")
    account_already_open_exception = ValueError("Account is already open")
    insufficient_balance_exception = ValueError("Balance is insufficient for requested withdrawal")
    invalid_amount_exception = ValueError("Amount deposited must be greater than zero")

    def __init__(self):
        self.isOpen = False
        self.balance = 0
        self.lock = threading.Lock()


    def get_balance(self):
        with self.lock:
            if self.isOpen == True:
                return self.balance
            else:
                raise BankAccount.account_not_open_exception

    def open(self):
        with self.lock:
            if self.isOpen == False:
                self.isOpen = True
            else:
                raise BankAccount.account_already_open_exception


    def deposit(self, amount):
        with self.lock:
            if self.isOpen == True:
                if amount <= 0: 
                    raise self.insufficient_balance_exception
                else:
                    self.balance += amount
            else:
                raise BankAccount.account_not_open_exception

    def withdraw(self, amount):
        with self.lock:
            if self.isOpen == True:
                if amount > self.balance or amount <= 0: 
                    raise self.insufficient_balance_exception
                else:
                    self.balance -= amount
            else:
                raise BankAccount.account_not_open_exception

    def close(self):
        with self.lock:
            if self.isOpen == True:
                self.isOpen = False
                self.balance = 0
            else:
                raise BankAccount.account_not_open_exception
