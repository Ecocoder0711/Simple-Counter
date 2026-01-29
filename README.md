<div align="center">

# 🎯 Simple Counter App

### A Beautiful, Animated Flutter Counter Application

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

---

### ✨ Experience a counter app like never before with stunning gradients, smooth animations, and delightful emoji reactions! ✨

</div>

---

## 📱 App Preview

<div align="center">

<img src="assets/simple_counter.gif" alt="App Demo" width="300" />

<br>

*Beautiful gradient UI with animated emoji reactions*

</div>

---

## 🌟 Features

✅ **Modern Gradient UI** - Eye-catching blue-purple-pink gradient background  
✅ **Smooth Animations** - Animated counter transitions with TweenAnimationBuilder  
✅ **Emoji Reactions** - Floating emoji animations on every button press (🎉 😢 🔄)  
✅ **Gradient Text Effects** - Counter display with beautiful gradient coloring  
✅ **Elevated Card Design** - Professional white card with custom shadows  
✅ **Three Actions** - Increment, Decrement, and Reset functionality  
✅ **Responsive Design** - Adapts to different screen sizes  
✅ **Custom Widgets** - Modular, reusable component architecture  

---

## 🎨 App Architecture

```
lib/
├── main.dart                    # App entry point
├── runapp.dart                  # App initialization
├── screen/
│   └── simplecounter.dart      # Main counter screen
└── widget/
    ├── buildactionbutton.dart  # Reusable action button widget
    └── animatedemojiwidget.dart # Floating emoji animation widget
```

---

## 🧠 How It Works

### **Core Logic Flow**

```
1. User Interaction
   └─> Button Press (Increment/Decrement/Reset)
       ├─> Update Counter State (setState)
       ├─> Trigger Number Animation (TweenAnimationBuilder)
       └─> Launch Emoji Animation (Overlay System)

2. Emoji Animation System
   └─> Create OverlayEntry
       ├─> Calculate Random X Position
       ├─> Animate from Bottom to Top
       ├─> Apply Fade & Scale Effects
       └─> Auto-remove after completion
```

### **Key Components**

#### 🔢 **Counter State Management**
```dart
int _counter = 0;  // Holds current counter value

void _increment() {
  setState(() {
    _counter += 1;  // Update state
  });
  _showEmojiAnimation('🎉');  // Trigger animation
}
```

#### 🎭 **Emoji Animation System**
```dart
void _showEmojiAnimation(String emoji) {
  // 1. Access app overlay layer
  final overlay = Overlay.of(context);
  
  // 2. Generate random horizontal position
  final startX = random.nextDouble() * screenWidth;
  
  // 3. Create overlay entry with animated widget
  overlayEntry = OverlayEntry(
    builder: (context) => AnimatedEmojiWidget(...)
  );
  
  // 4. Insert into overlay (renders above all widgets)
  overlay.insert(overlayEntry);
}
```

#### ✨ **Animation Breakdown**
```dart
// Vertical Movement: Bottom → Top
_verticalAnimation = Tween<double>(begin: 1.0, end: 0.0)
  .animate(CurvedAnimation(curve: Curves.easeOut));

// Opacity: Solid → Transparent (fades out)
_opacityAnimation = Tween<double>(begin: 1.0, end: 0.0)
  .animate(Interval(0.6, 1.0, curve: Curves.easeIn));

// Scale: Grows then normalizes (bouncy effect)
_scaleAnimation = TweenSequence([
  TweenSequenceItem(tween: Tween(begin: 0.5, end: 1.2), weight: 30),
  TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 70),
]);
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Android Studio / VS Code
- iOS Simulator / Android Emulator / Physical Device

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/counter_app.git
   cd counter_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📖 Usage

### Basic Operations

| Action | Button | Emoji | Description |
|--------|--------|-------|-------------|
| **Increment** | ➕ Green | 🎉 | Increases counter by 1 |
| **Decrement** | ➖ Red | 😢 | Decreases counter by 1 (min: 0) |
| **Reset** | 🔄 Orange | 🔄 | Resets counter to 0 |

---

## 🛠️ Technologies & Packages

- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design** - Design system
- **Custom Animations** - TweenAnimationBuilder, AnimationController
- **Overlay System** - Floating emoji layer
- **Gradient Effects** - LinearGradient for backgrounds and text

---

## 🎯 Key Features Explained

### 1️⃣ **Transparent AppBar**
```dart
AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
  scrolledUnderElevation: 0,
)
```
- Blends seamlessly with gradient background
- No shadow or elevation for modern flat design

### 2️⃣ **Gradient Background**
```dart
BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.blue.shade100, Colors.purple.shade100, Colors.pink.shade100]
  )
)
```
- Creates smooth color transition
- Enhances visual appeal

### 3️⃣ **Animated Counter Display**
```dart
TweenAnimationBuilder(
  tween: Tween<double>(begin: 0, end: _counter.toDouble()),
  duration: Duration(milliseconds: 300),
  builder: (context, value, child) => Text(value.toInt().toString())
)
```
- Smooth number transitions on value change
- 300ms animation duration for fluid feel

### 4️⃣ **Emoji Overlay System**
- Uses Flutter's `Overlay` widget
- Renders above all other widgets
- Independent lifecycle with auto-cleanup
- Random positioning for variety
- Multiple simultaneous animations supported

---

## 🎨 Customization

### Change Emojis
```dart
_showEmojiAnimation('🚀');  // Replace with any emoji
```

### Adjust Animation Speed
```dart
duration: Duration(milliseconds: 2000),  // Slower: increase, Faster: decrease
```

### Modify Colors
```dart
colors: [Colors.red.shade100, Colors.orange.shade100]  // Custom gradient
```

---

## 📝 Code Structure

### Widget Hierarchy
```
Container (Gradient Background)
└── Scaffold (Transparent)
    ├── AppBar (Transparent)
    └── Body
        └── Column (Centered)
            ├── Counter Display Card
            │   ├── "Counter Value" Text
            │   └── Animated Number
            └── Action Buttons Row
                ├── Decrement Button
                ├── Reset Button
                └── Increment Button
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Developer

<div align="center">

**Saksham Kashyap**

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/yourusername)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/yourprofile)

</div>

---

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Material Design for design guidelines
- Community for inspiration and support

---

<div align="center">

### ⭐ If you like this project, please give it a star! ⭐

**Made with ❤️ and Flutter**

</div>
