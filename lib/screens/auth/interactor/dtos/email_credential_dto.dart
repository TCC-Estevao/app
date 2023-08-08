class EmailCredentialDTO {
  final String email;
  final String password;

  EmailCredentialDTO({required this.email, required this.password});
  EmailCredentialDTO.empty()
      : email = "",
        password = '';
}
