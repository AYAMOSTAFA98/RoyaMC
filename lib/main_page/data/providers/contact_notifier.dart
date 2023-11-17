import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final StateNotifierProvider<ContactNotifier, Object?> contactProvider =
    StateNotifierProvider(
  (ref) => ContactNotifier(ref),
);

class ContactNotifier extends StateNotifier<void> {
  ContactNotifier(this.ref) : super(null);
  String name = '', email = '', phone = '', subject = '', message = '';
  final Ref ref;
  postContact() async {
    Response response = await Dio()
        .post('https://royamedicalcenter.com/api/v1/contact-us', data: {
      "contact_name": name,
      "contact_email": email,
      "contact_phone": phone,
      "contact_subject": subject,
      "contact_message": message
    });
    if (response.statusCode == 200) {
      print("contact_name");
    }
    
  }
}
