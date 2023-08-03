import 'constants/financialAccountType.dart';

class FinancialAccount {
  final String id;
  final String description;
  final FinancialAccountTypeEnum financialAccountType;
  final String userId;

  FinancialAccount(
      this.id, this.description, this.financialAccountType, this.userId);
}
