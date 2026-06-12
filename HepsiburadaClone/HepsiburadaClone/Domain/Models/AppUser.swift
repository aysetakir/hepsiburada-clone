struct AppUser: Identifiable, Codable {
    let id: String
    let email: String
    var fullName: String
}
