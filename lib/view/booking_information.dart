import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/components/booking/dropoff_date_time.dart';
import 'package:turbo_rent/components/booking/footer_booking_information.dart';
import 'package:turbo_rent/components/booking/pickup_date_time.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/space_wh.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/booking_view_model.dart';
import 'package:turbo_rent/view_model/places_view_model.dart';

class BookingInformations extends StatelessWidget {
  const BookingInformations({
    super.key,
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    final providerplaces = context.watch<PlacesViewModel>();
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Booking Information",
            style: titleCardName,
          ),
          const SpaceWH(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03, vertical: 10),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: specialCard2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      prefixText: "DROP OF CITY : ",
                      prefixStyle: TextStyle(
                        color: kwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    dropdownColor: grayText,
                    value: providerplaces.dropbutton,
                    iconSize: 20,
                    elevation: 16,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: kwhite,
                    ),
                    items: providerplaces.placeList.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: textstyle(14, FontWeight.bold, kwhite),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      providerplaces.setDropDown(newValue!);
                    },
                  ),
                ),
                const SpaceWH(height: 15),
                Consumer<BookingViewModel>(
                  builder: (context, pro, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: const BoxDecoration(
                        gradient: specialCard2,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: CheckboxListTile(
                        checkColor: blueButton,
                        activeColor: kwhite,
                        title: Text(
                          'Do you need a Driver.?',
                          style: textstyle(14, FontWeight.bold, kwhite),
                        ),
                        value: pro.isDriverRequired,
                        onChanged: (value) {
                          pro.isDriver(value!);
                          pro.getTheTotalHours(context, index);
                        },
                      ),
                    );
                  },
                ),
                const SpaceWH(height: 20),
                PickUpDateTime(index: index),
                const SpaceWH(height: 20),
                DropOffDateTime(index: index),
                const SpaceWH(height: 20),
                const SpaceWH(height: 20),
                FooterBoookingInfo(index: index),
              ],
            ),
          ),
          const SpaceWH(height: 15),
        ],
      ),
    );
  }
}
