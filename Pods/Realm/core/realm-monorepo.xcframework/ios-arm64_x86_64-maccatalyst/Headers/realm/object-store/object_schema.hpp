////////////////////////////////////////////////////////////////////////////
//
// Copyright 2015 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

#ifndef REALM_OBJECT_SCHEMA_HPP
#define REALM_OBJECT_SCHEMA_HPP

#include <realm/keys.hpp>
#include <realm/string_data.hpp>

#include <string>
#include <vector>

namespace realm {
class Group;
class Schema;
class Table;
enum class PropertyType : unsigned short;
struct ObjectSchemaValidationException;
struct Property;

enum SchemaValidationMode { Basic = 0, SyncPBS = 1, RejectEmbeddedOrphans = 2, SyncFLX = 4 };

class ObjectSchema {
public:
    /// The type of tables supported by a realm.
    /// Note: Enumeration value assignments must be kept in sync with <realm/table.hpp>.
    enum class ObjectType : uint8_t { TopLevel = 0, Embedded = 0x1, TopLevelAsymmetric = 0x2 };

    ObjectSchema();
    ObjectSchema(std::string name, std::initializer_list<Property> persisted_properties);
    ObjectSchema(std::string name, ObjectType table_type, std::initializer_list<Property> persisted_properties);
    ObjectSchema(std::string name, std::initializer_list<Property> persisted_properties,
                 std::initializer_list<Property> computed_properties, std::string name_alias = "");
    ObjectSchema(std::string name, ObjectType table_type, std::initializer_list<Property> persisted_properties,
                 std::initializer_list<Property> computed_properties, std::string name_alias = "");
    ~ObjectSchema();

    ObjectSchema(ObjectSchema const&) = default;
    ObjectSchema(ObjectSchema&&) noexcept = default;
    ObjectSchema& operator=(ObjectSchema const&) = default;
    ObjectSchema& operator=(ObjectSchema&&) noexcept = default;

    // create object schema from existing table
    // if no table key is provided it is looked up in the group
    ObjectSchema(Group const& group, StringData name, TableKey key);

    std::string name;
    std::vector<Property> persisted_properties;
    std::vector<Property> computed_properties;
    std::string primary_key;
    TableKey table_key;
    ObjectType table_type = ObjectType::TopLevel;
    std::string alias;

    Property* property_for_public_name(StringData public_name) noexcept;
    const Property* property_for_public_name(StringData public_name) const noexcept;
    Property* property_for_name(StringData name) noexcept;
    const Property* property_for_name(StringData name) const noexcept;
    Property* primary_key_property() noexcept
    {
        return property_for_name(primary_key);
    }
    const Property* primary_key_property() const noexcept
    {
        return property_for_name(primary_key);
    }
    bool property_is_computed(Property const& property) const noexcept;

    void validate(Schema const& schema, std::vector<ObjectSchemaValidationException>& exceptions,
                  SchemaValidationMode validation_mode) const;

    friend bool operator==(ObjectSchema const& a, ObjectSchema const& b) noexcept;

    static PropertyType from_core_type(ColumnType type);
    static PropertyType from_core_type(ColKey col);
    static PropertyType from_core_type(CollectionType type);

private:
    void set_primary_key_property() noexcept;
};

std::ostream& operator<<(std::ostream& o, ObjectSchema::ObjectType table_type);

} // namespace realm

#endif /* defined(REALM_OBJECT_SCHEMA_HPP) */
