import 'package:dw9_delivery_app/app/core/ui/base_state/base_state.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_controller.dart';
import 'package:dw9_delivery_app/app/pages/auth/register/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends BaseState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _celularEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _celularEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterController, RegisterState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          register: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao registrar usuário');
          },
          success: () {
            hideLoader();
            showSuccess('Cadastro realizado com sucesso');
            Navigator.pop(context);
          },
        );
      },
      child: Scaffold(
        appBar: DeliveryAppbar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyles.textTitle,
                ),
                Text(
                  'Preencha os campos abaixo para criar o seu cadastro.',
                  style: context.textStyles.textMedium.copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  controller: _nameEC, style: const TextStyle(color: Colors.white),
                  validator: Validatorless.required('* Nome Obrigatório'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  controller: _emailEC, style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required('* E-mail obrigatorio'),
                    Validatorless.email('E-mail inválido'),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Celular'),
                  controller: _celularEC, style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required('* Celular obrigatorio'),
                    Validatorless.number('Valor não é um número valido'),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Senha'),
                  controller: _passwordEC, style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  validator: Validatorless.multiple([
                    Validatorless.required('* Senha obrigatorio'),
                    Validatorless.min(
                        6, 'Senha deve conter pelomenos 6 caracteres'),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Confirmar Senha'),
                  obscureText: true, style: const TextStyle(color: Colors.white),
                  validator: Validatorless.multiple([
                    Validatorless.required('* Confirmar senha, obrigatorio!'),
                    Validatorless.compare(
                        _passwordEC, 'As senhas não conferem'),
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: DeliveryButton(
                    onPressed: () {
                      final valid = _formKey.currentState?.validate() ?? false;
                      if (valid) {
                         controller.register(
                          _nameEC.text, 
                          _emailEC.text,
                          _celularEC.text, 
                          _passwordEC.text
                          );
                      }
                    },
                    label: 'Cadastrar',
                    width: double.infinity,
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
