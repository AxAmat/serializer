import std.json : JSONValue;

/******
Функция переводит структуру в строку JSON.
Пример:
    struct Person {
        string name;
        int age;
    }

	struct User {
		Person p;
		int experience;
	}

	Person p = Person("Алексей", 38);
	User a = User(p, 3);

    writeln(marshalize(a)) // {"experience":3,"p":{"age":38,"name":"Алексей"}}
*/
string marshalize(T)(T s)
{
    return structToJSON(s).toString;
}

private JSONValue structToJSON(T)(T s)
{
    JSONValue j;

    foreach (field; __traits(allMembers, T))
    {
        auto val = __traits(getMember, s, field);

        static if (is(typeof(val) == struct)) 
            j[field] = structToJSON(val);
        else 
            j[field] = val;
    }
    return j;
}
