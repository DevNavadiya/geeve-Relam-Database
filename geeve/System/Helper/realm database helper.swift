

import UIKit
import RealmSwift

class modulforReamldata : Object {
    
  @Persisted  var name : String
  @Persisted  var lastname : String
  @Persisted var phonenumber : String
  @Persisted var email : String
  @Persisted  var password : String
  @Persisted var conformPassword : String
  @Persisted (primaryKey: true) var _id: ObjectId
    
   convenience init(name: String, lastname: String, phonenumber: String, email: String, password: String, conformPassword: String) {
      
        self.init()
        self.name = name
        self.lastname = lastname
        self.phonenumber = phonenumber
        self.email = email
        self.password = password
        self.conformPassword = conformPassword
       
    }
    
}


class dataBaseHelperRealm {
    
    
    func getdxatabaseurl () -> URL? {
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    static let sher = dataBaseHelperRealm()
    
    let realm = try! Realm()
    
    func savedata (data : modulforReamldata) {
        
        try! realm.write({
            realm.add(data)
        })
        
    }
    
    func DataFromeRealm () -> [modulforReamldata]{
       
        return Array(realm.objects(modulforReamldata.self))
        

    }
    
    
    func deletdata (modulforReamldata : modulforReamldata) {
        try! realm.write({
            realm.delete(modulforReamldata.self)
        })
    }
    
    func updateUser(with newData: modulforReamldata) {
        guard let existingUser = realm.object(ofType: modulforReamldata.self, forPrimaryKey: newData._id) else {
               // Handle the case where the object with the given primary key doesn't exist
               return
        }

        do {
            try realm.write {
                existingUser.name = newData.name
                existingUser.lastname = newData.lastname
                existingUser.phonenumber = newData.phonenumber
                existingUser.email = newData.email
                existingUser.password = newData.password
                existingUser.conformPassword = newData.conformPassword
            }
        } catch {
            // Handle the error
            print("Error updating user: \(error.localizedDescription)")
        }
    }
}
