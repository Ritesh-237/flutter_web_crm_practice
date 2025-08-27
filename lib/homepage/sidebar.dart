import 'package:flutter/material.dart';
import 'menu_item.dart';

class Sidebar extends StatelessWidget {
  final List<MenuItemModel> items;
  final int selectedIndex;
  final bool isExpanded;
  final ColorScheme myColors;
  final Function(int) onItemSelected;

  const Sidebar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.isExpanded,
    required this.myColors,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? 220 : 70,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: myColors.primaryContainer,
        // color: myColors.tertiary,
        color: myColors.inversePrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            // flex: 6 ,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () => onItemSelected(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? myColors.onPrimary : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            item.icon,
                            color: isSelected ? Colors.blue : myColors.outline,
                          ),
                        ),
                        if (isExpanded)
                          Expanded(
                            child: Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 14,
                                color:
                                    isSelected ? Colors.blue : myColors.outline,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Spacer(),
          GestureDetector(
            onTap: () {
              onItemSelected(
                items.length,
              ); // UserDetailsPage is at the last index
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: myColors.onPrimary,
              ),
              child:
                  isExpanded
                      ? ListTile(
                        leading: ClipOval(
                          child: Image.asset(
                            "lib/assets/man.png",
                            height: 35,
                            width: 35,
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: const Text(
                          "User Profile",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
                        ),
                      )
                      : Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: ClipOval(
                          child: Image.asset(
                            "lib/assets/man.png",
                            height: 35,
                            width: 35,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
