class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Aaryan Mehta",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/Aaryan.png",
    time: "3m ago",
    isActive: true,
  ),
  Chat(
    name: "Pranav Awhad",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/Pranav_Awhad.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Atharv Parab",
    lastMessage: "Do you have update...",
    image: "assets/images/Atharv.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Pranav Padawe",
    lastMessage: "You are welcome :)",
    image: "assets/images/Pranav.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Abhishek Chary",
    lastMessage: "Thanks",
    image: "assets/images/Abhishek.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Aryan Dubey",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/Aryan_Dubey.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Ashish Shingade",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Bhavesh Pansare",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
];
