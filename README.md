# I call it ChopUp - Food Delivery Ecommerce App

A modern, responsive food delivery application built with Flutter that provides a seamless ordering experience for customers. The app features a clean UI, efficient state management, and a robust architecture following best practices.

## Key Features

### **Home & Navigation**
- **Splash Screen**: Animated logo with smooth transitions
- **Bottom Navigation**: Easy navigation between Home, History, Cart, and Profile
- **Location-based Services**: Display current location (Ibadan, Nigeria)
- **Search Functionality**: Quick food item search

### **Food Discovery**
- **Popular Foods**: Featured dishes with detailed information
- **Recommended Foods**: Personalized food recommendations
- **Food Categories**: Organized food browsing experience
- **Food Details**: Comprehensive food information including:
  - High-quality food images
  - Detailed descriptions
  - Pricing information
  - Star ratings
  - Location details

### **Shopping Cart**
- **Add to Cart**: Easy one-tap cart addition
- **Cart Management**: 
  - Quantity adjustment
  - Item removal
  - Real-time price calculation
- **Cart History**: Track previous orders
- **Persistent Storage**: Cart data saved locally

### **User Experience**
- **Responsive Design**: Adapts to different screen sizes
- **Smooth Animations**: Page transitions and loading states
- **Modern UI**: Clean, intuitive interface
- **Loading States**: Proper loading indicators
- **Error Handling**: Graceful error management

##  Architecture

### **State Management**
- **GetX**: Used for state management, dependency injection, and routing
- **Controllers**: Separate controllers for different features
  - `PopularProductController`
  - `RecommendedProductController` 
  - `CartController`

### **Project Structure**
```
lib/
├── controllers/          # State management controllers
├── data/
│   ├── api/            # API client and network layer
│   └── repository/     # Data repositories
├── models/             # Data models
├── routes/             # Navigation and routing
├── screens/            # UI screens
│   ├── cart/          # Cart-related screens
│   ├── food/          # Food detail screens
│   ├── home/          # Main app screens
│   └── splash/        # Splash screen
├── utilities/          # App constants, colors, dimensions
├── widgets/            # Reusable UI components
└── helper/            # Dependency injection setup
```

### **Key Technologies**
- **Flutter**: Cross-platform UI framework
- **GetX**: State management and routing
- **Shared Preferences**: Local data persistence
- **HTTP Client**: API communication
- **Custom Fonts**: Roboto font family

## 🚀 Getting Started

### **Prerequisites**
- Flutter SDK (>=3.0.0)
- Dart SDK
- Android Studio / VS Code
- Git

### **Installation**

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/food_delivery_ecommerce.git
   cd food_delivery_ecommerce
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### **Building for Production**

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

## Screenshots

The app includes the following key screens:
- **Splash Screen**: Animated logo introduction
- **Home Screen**: Food discovery with popular and recommended items
- **Food Detail Screen**: Comprehensive food information
- **Cart Screen**: Shopping cart management
- **Profile Screen**: User account management
- **History Screen**: Order history tracking

## Configuration

### **API Configuration**
The app uses external APIs for food data:
- Base URL: `https://api.npoint.io`
- Popular Products: `/4a9d14234a33b7c4630c`
- Recommended Products: `/0ae82c670ce07a18cfac`

### **App Constants**
- App Name: "ChopUp"
- Version: 1.0.0+1
- Target Location: Ibadan, Nigeria

## Design System

### **Color Palette**
- **Main Color**: `#89dad0` (Teal)
- **Text Color**: `#ccc7c5` (Light Gray)
- **Icon Colors**: `#ffd28d`, `#fcab88` (Warm tones)
- **Background**: `#f7f6f4` (Light Gray)
- **Accent**: `#ffd379` (Yellow)

### **Typography**
- **Font Family**: Roboto
- **Weights**: Regular (400), Medium (500), Bold (700), Black (900)
- **Responsive Sizing**: Dynamic font sizes based on screen dimensions

### **Dimensions**
The app uses responsive dimensions that adapt to different screen sizes:
- Dynamic height and width calculations
- Responsive padding and margins
- Adaptive icon sizes
- Flexible container dimensions

## Dependencies

### **Core Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.7.2                    # State management
  dots_indicator: ^4.0.0         # Page indicators
  shared_preferences: ^2.5.3     # Local storage
  intl: ^0.17.0                  # Internationalization
  cupertino_icons: ^1.0.2        # iOS icons
```

## Data Flow

1. **API Integration**: Food data fetched from external APIs
2. **Repository Pattern**: Data access through repositories
3. **Controller Layer**: Business logic and state management
4. **UI Layer**: Reactive UI updates based on state changes
5. **Local Storage**: Cart and user preferences persisted locally

##  Development

### **Adding New Features**
1. Create models in `lib/models/`
2. Add controllers in `lib/controllers/`
3. Create repositories in `lib/data/repository/`
4. Build UI screens in `lib/screens/`
5. Update routes in `lib/routes/route_helper.dart`

### **Code Style**
- Follow Flutter/Dart conventions
- Use meaningful variable and function names
- Implement proper error handling
- Add comments for complex logic

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Roadmap

- [ ] User authentication and registration
- [ ] Payment integration
- [ ] Real-time order tracking
- [ ] Push notifications
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Restaurant ratings and reviews
- [ ] Advanced search and filtering

Personal access client created successfully.
Client ID: 2
Client secret: FTb4XtTj8kLMzOPlNbF8uVW9KGVXpyRwRmtva6HD
Password grant client created successfully.
Client ID: 3
Client secret: FJ4Er7HdDEraxyZzhHJsoQMzjiiDGnybXf4E68Kr
