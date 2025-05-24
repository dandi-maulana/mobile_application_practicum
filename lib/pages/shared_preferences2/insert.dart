import 'package:flutter/material.dart';
import 'package:mobile_application_practicum/pages/shared_preferences2/data.dart';

class Insert extends StatefulWidget {
  final index;
  final value;

  Insert({Key? key, required this.index, required this.value})
    : super(key: key);
  @override
  _InsertState createState() => _InsertState(index: index, value: value);
}

class _InsertState extends State<Insert> {
  _InsertState({@required this.index, @required this.value}) : super();

  // variabel untuk menampung data yang dikirim dari halaman home
  final index;
  final value;

  // controller TextField untuk validasi
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  // cek semua data sudah diisi atau belum
  isDataValid() {
    if (nameController.text.isEmpty) {
      return false;
    }
    if (addressController.text.isEmpty) {
      return false;
    }
    if (phoneController.text.isEmpty) {
      return false;
    }
    return true;
  }

  getData() {
    // jika nilai index dan value yang dikirim dari page home tidak null
    // artinya ini adalah operasi update
    // tampilkan data yang dikirim, sehingga user bisa edit
    if (index != null && value != null) {
      setState(() {
        nameController.text = value['name'];
        addressController.text = value['address'];
        phoneController.text = value['phone'];
      });
    }
  }

  // proses menyimpan data yang diinput user ke Shared Preferences
  saveData() async {
    // cek semua data sudah diisi atau belum
    // jika belum tampilkan pesan error
    if (isDataValid()) {
      // data yang akan diupdate ke Shared Preferences sesuai input user
      var customer = {
        'name': nameController.text,
        'address': addressController.text,
        'phone': phoneController.text,
      };

      // ambil data Shared Preferences sebagai list
      var savedData = await Data.getData();
      if (index == null) {
        // index == null artinya proses insert
        // masukkan data pada index 0 pada data Shared Preferences
        // sehingga pada halaman Home data yang baru dimasukkan
        // akan tampil paling atas
        savedData.insert(0, customer);
      } else {
        // jika index tidak null artinya proses update
        // update data Shared Preferences sesuai index-nya
        savedData[index] = customer;
      }

      // simpan data diinsert/diedit user ke Shared Preferences kembali
      // kemudian tutup halaman insert ini
      await Data.saveData(savedData);
      Navigator.pop(context);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Empty Field'),
            content: Text('Please fill all field.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  deleteData() async {
    // ambil data Shared Preferences sebagai list
    // delete data pada index yang sesuai
    // kemudian simpan kembali ke Shared Preferences
    // dan kembali ke halaman Home
    var savedData = await Data.getData();
    savedData.removeAt(index);
    await Data.saveData(savedData);
    Navigator.pop(context);
  }

  getDeleteButton() {
    // jika proses update tampilkan tombol delete
    // jika insert return widget kosong
    if (index != null && value != null) {
      return TextButton(
        onPressed: deleteData,
        child: Text('DELETE', style: TextStyle(color: Colors.white)),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          getDeleteButton(),
          TextButton(
            onPressed: saveData,
            child: Text('SAVE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name'),
            TextField(controller: nameController),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('Address'),
            TextField(controller: addressController),
            Padding(padding: EdgeInsets.only(top: 20)),
            Text('Phone'),
            TextField(controller: phoneController),
          ],
        ),
      ),
    );
  }
}
