import 'package:collection_tracker/card_searcher/card_searcher_controller.dart';
import 'package:collection_tracker/models/playing_card.dart';
import 'package:collection_tracker/routes/app_routes.dart';
import 'package:collection_tracker/theme/text_theme.dart';
import 'package:collection_tracker/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class AutoCompleteInput extends GetView<CardSearcherController> {
  final Function(String selectedOption) onSelected;
  final options;

  AutoCompleteInput({required this.onSelected, required this.options});

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsMaxHeight: 250,
      displayStringForOption: (String option) => option,
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return options.where(
          (String option) {
            return option
                .toString()
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase());
          },
        );
      },
      onSelected: onSelected,
      optionsViewBuilder: (context, Function(String) onSelected, options) {
        return _AutocompleteOptions(
          displayStringForOption: (String option) => option,
          maxOptionsHeight: 250,
          onSelected: onSelected,
          options: options,
        );
      },
      fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
        return TextField(
          style: AppTextTheme.bodyText1,
          onSubmitted: onSelected,
          cursorColor: AppColors.darkGreyBlue,
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.darkGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.darkGreyBlue,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AutocompleteOptions<T extends Object>
    extends GetView<CardSearcherController> {
  const _AutocompleteOptions({
    Key? key,
    required this.displayStringForOption,
    required this.onSelected,
    required this.options,
    required this.maxOptionsHeight,
  }) : super(key: key);

  final AutocompleteOptionToString<T> displayStringForOption;

  final AutocompleteOnSelected<T> onSelected;

  final Iterable<T> options;
  final double maxOptionsHeight;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 4.0,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: maxOptionsHeight,
              maxWidth: MediaQuery.of(context).size.width * 0.70),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) {
              final T option = options.elementAt(index);
              return InkWell(
                onTap: () {
                  onSelected(option);
                },
                child: Builder(builder: (BuildContext context) {
                  final bool highlight =
                      AutocompleteHighlightedOption.of(context) == index;
                  if (highlight) {
                    SchedulerBinding.instance!
                        .addPostFrameCallback((Duration timeStamp) {
                      Scrollable.ensureVisible(context, alignment: 0.5);
                    });
                  }
                  return Container(
                    color: highlight ? AppColors.lightBlueGrey : null,
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      displayStringForOption(option),
                      style: AppTextTheme.bodyText1,
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
