import 'package:flutter/material.dart';
import '../utilities/app_size.dart';
import 'custom_field_header.dart';

class CustomDropDown<T extends Object> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.title,
    required this.isRequired,
    required this.validatorFunction,
    this.hint = "Select",
  });

  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String hint;
  final String title;
  final bool isRequired;
  final FormFieldValidator<T>? validatorFunction;

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T extends Object> extends State<CustomDropDown<T>> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFieldHeader.get(
          context: context,
          title: widget.title,
          isRequired: widget.isRequired,
        ),
        AppSize.gapH10,
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<T>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Theme.of(context).textTheme.bodyMedium,
            menuMaxHeight: 250,
            icon: const Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              errorStyle: Theme.of(context).textTheme.titleSmall,
              contentPadding: const EdgeInsets.all(10),
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5, color: Colors.black),
                borderRadius: BorderRadius.circular(7),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.black),
                borderRadius: BorderRadius.circular(7),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(7),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 0.5, color: Colors.black),
                borderRadius: BorderRadius.circular(7),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.black54),
                borderRadius: BorderRadius.circular(7),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: Colors.red),
                borderRadius: BorderRadius.circular(7),
              ),
              hintText: widget.hint,
              hintStyle: Theme.of(context).textTheme.bodySmall,
            ),
            items: widget.items,
            onChanged: widget.onChanged,
            validator: widget.validatorFunction,
          ),
        ),
      ],
    );
  }
  @override
  bool get wantKeepAlive => true;
}