import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  void _onPasswordChange(String password) {
    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) {
        _isPasswordEightCharacters = true;
      }

      _hasPasswordOneNumber = false;
      if (RegExp(r'[0-9]').hasMatch(password)) {
        _hasPasswordOneNumber = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Create Your Account",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "SF-Pro",
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Set a password",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontFamily: "SF-Pro"),
          ),
          const Gap(10),
          Text(
            "Please create a strong password including the following",
            style: TextStyle(
                fontSize: 18,
                height: 1.5,
                color: Colors.grey.shade600,
                fontFamily: "SF-Pro"),
          ),
          const Gap(20),
          TextField(
            onChanged: (password) => _onPasswordChange(password),
            obscureText: !_isVisible,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black)),
                hintText: "Password",
                hintStyle: const TextStyle(
                  fontFamily: "SF-Pro",
                ),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0)),
          ),
          const Gap(30),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: _isPasswordEightCharacters
                      ? Colors.green
                      : Colors.transparent,
                  border: _isPasswordEightCharacters
                      ? Border.all(color: Colors.transparent)
                      : Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
              ),
              const Gap(10),
              const Text("Contains at least 8 characters"),
            ],
          ),
          const Gap(10),
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color:
                      _hasPasswordOneNumber ? Colors.green : Colors.transparent,
                  border: _hasPasswordOneNumber
                      ? Border.all(color: Colors.transparent)
                      : Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15.0,
                  ),
                ),
              ),
              const Gap(10),
              const Text("Contains at least 1 number"),
            ],
          ),
          const Gap(50),
          MaterialButton(
            height: 40.0,
            minWidth: double.infinity,
            onPressed: () {},
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Text(
              "Create Account",
              style: TextStyle(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }
}
