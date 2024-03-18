import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/network/NetworkManager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final municipality = TextEditingController();
  final department = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  static AddressController get instance => Get.find();

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAdresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {

      /*Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const CircularLoader()
      );*/

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Guardando dirección...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          postalCode: postalCode.text.trim(),
          municipality: municipality.text.trim(),
          department: department.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      address.id = id;
      await selectAddress(address);

      FullScreenLoader.stopLoading();

      Loaders.successSnackBar(title: '¡Exitoso!', message: 'Tu dirección ha sido agregada con exito.');

      refreshData.toggle();

      resetFormFields();

      Navigator.of(Get.context!).pop();

    } catch (e) {
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: '¡Ocurrio un error!', message: e.toString());
    }
  }

  void resetFormFields(){
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    municipality.clear();
    department.clear();
    addressFormKey.currentState?.reset();
  }
}
