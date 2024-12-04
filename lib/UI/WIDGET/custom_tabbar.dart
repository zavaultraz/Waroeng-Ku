part of 'widget.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key,required this.selectedIndex,required this.titles, this.onTap});
  final int selectedIndex;
  final List<String> titles;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 60,  // Increased height for better visuals
      child: Stack(
        children: [
          // Background Line Under Tabs
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 1,
              color: Color(0xFFF2F2F2),  // Lighter background line color
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,  // Centering the tabs within the row
            children: titles.map((title) {
              int index = titles.indexOf(title);
              bool isSelected = index == selectedIndex;  // Check if the tab is selected

              return Expanded(  // Allow tabs to take equal space and handle overflow
                child: GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(index);  // Execute onTap callback with the index of the clicked tab
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),  // Horizontal padding between tabs
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,  // Font size for better readability
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? mainColor : Colors.black.withOpacity(0.6), // Active tab color and opacity for inactive tabs
                          ),
                        ),
                        SizedBox(height: 8),  // Space between the text and the indicator
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),  // Smooth transition for the indicator
                          width: isSelected ? 40 : 0,  // Show the indicator only for selected tab
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isSelected ? mainColor : Colors.transparent,  // Indicator color for active tab
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );

  }
}
