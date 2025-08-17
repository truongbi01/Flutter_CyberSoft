import 'dart:io';
class BankAcount{
 String?  accNum;
  String? ownName;
  double balance;
  BankAcount({this.accNum='', this.ownName='', this.balance=0});
  void deposit(double money){
    balance += money;

  }
  void withdraw(double money){
    balance -= money;
  }
  void checkBalance(){
    print('Số dư tài khoản: $balance');
  }
}
void main(){
  final account = BankAcount(accNum: '000', ownName: 'Nguyen Van A', balance: 1000 );
  account.withdraw(10);
  account.checkBalance();
}