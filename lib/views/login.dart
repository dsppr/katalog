import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next, // Moves focus to the next field
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true, // Hides the text for passwords
              textInputAction: TextInputAction.done, // Indicates the "Enter" button action
              onSubmitted: (_) {
                _handleLogin(context); // Called when "Enter" is pressed
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _handleLogin(context); // Handle login when button is clicked
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin(BuildContext context) {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      // Navigate to the next page
      Navigator.pushNamed(context, '/catalog');
    } else {
      // Show an error if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both username and password')),
      );
    }
  }
}
