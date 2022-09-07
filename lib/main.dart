import 'package:flutter/material.dart';
//import 'package:flutter_paystack/flutter_paystack.dart';
//import 'package:paystack_manager/paystack_manager.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PayPage(),
    );
  }
}

class PayPage extends StatefulWidget {
  //const PayPage({Key? key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
  var secretKey = 'sk_test_8316281b7886e693404c398b6976431f3a91e5cf';
  var publicKey = 'pk_test_d2c23c028b4f096e2cd26cc6810d80f596c5bf47';
  final plugin = PaystackPlugin();
  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey);
  }
  // void paymentSection() async {
  //   Charge charge = Charge()
  //       ..amount = 10
  //       ..email = 'developerbioye@gmail.com';
  //   CheckoutResponse response = await plugin.checkout(context, charge: charge, method: CheckoutMethod.card);
  // }
  //
  void paySection() async {
    Charge charge = Charge()
        ..amount = 100000
        ..reference = DateTime.now().millisecondsSinceEpoch.toString()
        ..email = 'developerbioye@gmail.com';
    CheckoutResponse response = await plugin.checkout(context, charge: charge, method: CheckoutMethod.card);
    print(response.message);
    if(response.message == 'Success') {
      setState(() {
        amount += 1000;
      });
    }




  }
  int amount = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),),
        title: Text('Payment Section',style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,

      ),
      resizeToAvoidBottomInset: false,
      body:

      Column(
        children: [
          SizedBox(height: 200),
          Text("You've paid NGN$amount", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Center(
            child: ElevatedButton.icon(onPressed: (){
              //_checkPayment();
              paySection();
            }, icon: Icon(Icons.payment), label: Text('Payment Section', style: TextStyle(fontWeight: FontWeight.bold)),
            style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            )),padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((Set<MaterialState> states){
              return EdgeInsets.fromLTRB(30, 12, 30, 12);
    }),
          ),
    )),
        ],
      ));
  }
}
//void onSuccesful(Transaction transaction){
  //   print('Transaction Successful');
  //   print('${transaction.message}');
  // }
  // void onPending(Transaction transaction){
  //   print('Transaction Pending');
  //   print('${transaction.message}');
  // }
  // void onCancel(Transaction transaction){
  //   print('Transaction Cancelled');
  //   print('${transaction.message}');
  // }
  // void onFailed(Transaction transaction){
  //   print('Transaction Failed');
  //   print('${transaction.message}');
  // }
  // void _checkPayment() async {
  //   // try{
  //   //   PaystackPayManager(context: context)
  //   //       ..setSecretKey(secretKey)
  //   //       ..setEmail('developerbioye@gmail.com')
  //   //       ..setAmount(100000)
  //   //       ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
  //   //       ..setFirstName('Habeeb')
  //   //       ..setLastName('Bioye')
  //   //       ..setCurrency('NGN')
  //   //       ..setMetadata({
  //   //         'custom field': [{
  //   //           'value': 'BeebCodes',
  //   //           'display_name': 'payment_to',
  //   //           'variable_name': 'payment_to'
  //   //         }
  //   //
  //   //         ],
  //   //       })
  //   //       ..onSuccesful(onSuccesful)
  //   //       ..onPending(onPending)
  //   //       ..onCancel(onCancel)
  //   //       ..onFailed(onFailed)
  //   //       ..initialize();
  //   //
  //   // }
  //   // catch (error){
  //   //   print(error);
  //   //}
  //
  // }


