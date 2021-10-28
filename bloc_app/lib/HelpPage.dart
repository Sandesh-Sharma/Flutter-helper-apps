class ContactUs extends StatefulWidget {
  ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Color(0xFF56ccf2),
  body: SafeArea(
      top: false,
      bottom: false,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 5.0, left: 15.0, right: 15.0),
                child: Card(
                  elevation: 6,
                  child: Form(
                      key: _formKey,
                      autovalidate: _autoValidate,
                      child: ListView(
                        shrinkWrap: true, 
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        children: <Widget>[
                          //===> Student Number Text Input starts from here <===
                          Padding(
                            padding: EdgeInsets.only(
                          top: 10.0, bottom: 6.0, left: 1.0, right: 1.0),
                            child: TextFormField(
                              autofocus: false,
                              focusNode: myFocusNodeEmail,
                              controller: studentNumberController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Student Number',
                              ),
                              validator: validateStudentNumber,
                              onSaved: (String val) {
                                _stNumber = val;
                              },
                            ),
                          ),

                          //===> Email Address Text Input starts from here <===
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 6.0, left: 1.0, right: 1.0),
                            child: TextFormField(
                              validator: validateStudentEmailAddress,
                              onSaved: (String val) {
                                _stEmail = val;
                              },
                              controller: studentEmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Student Email',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black),
                            ),
                          ),

                          //===> Phone Number Text Input starts from here <===
                          Padding(
                            padding: EdgeInsets.only(
                                top: 1.0, bottom: 6.0, left: 1.0, right: 1.0),
                            child: TextFormField(
                              validator: validateStudentPhoneNumber,
                              onSaved: (String val) {
                                _stPhone = val;
                              },
                              controller: studentPhoneNumberController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelText: 'Phone Number',
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[()\d -]{1,15}$')),
                              ],
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black),
                            ),
                          ),

                          //===> Drop Down Menu starts from here <===
                          Padding(
                            padding: EdgeInsets.only(top: 1.0, bottom: 6.0, left: 1.0, right: 1.0),
                            child: FormField(
                              builder: (FormFieldState state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelText: 'Semester',
                                    hintText: ("Semester"),
                                  ),
                                  isEmpty: _semester == '',
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 1.0, right: 130 , ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: DropdownButtonHideUnderline( 
                                        child: ButtonTheme(
                                          alignedDropdown: true, 
                                          child: DropdownButton(
                                            value: _semester,
                                            isDense: true,
                                            elevation: 5,
                                            isExpanded: true,
                                            onChanged: (String value) {
                                              setState(() {
                                                _semester = value; 
                                                state.didChange(value);
                                              });
                                            },
                                            items: _semesters.map((String value) {
                                              return DropdownMenuItem(
                                                value: value,  
                                                child: Text(value ?? '',
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    softWrap: true,
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          //===> Query Text Input starts from here <===
                          TextFormField(
                            validator: validateStudentQuery,
                            onSaved: (String val) {
                              _query = val;
                            },
                            controller: queryController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelText: 'Your Query',
                            ),
                            keyboardType: TextInputType.text,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black),
                            maxLines: 3,
                          ),

                          Container(
                              margin: EdgeInsets.only(top: 6.0, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                    color:  Color(0xFF008ECC),
                                    offset: Offset(0.0, 0.0),
                                    //blurRadius: 20.0,
                                  ),
                                  BoxShadow(
                                    color:  Color(0xFF008ECC),
                                    offset: Offset(0.0, 0.0),
                                    //blurRadius: 20.0,
                                  ),
                                ],
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF008ECC), //Colors is Olympic blue
                                      Color(0xFF008ECC),
                                    ],
                                    begin: FractionalOffset(0.2, 0.2),
                                    end: FractionalOffset(1.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: MaterialButton(
                                onPressed: validateAndSubmit,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 65.0),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      )),
  }
}
