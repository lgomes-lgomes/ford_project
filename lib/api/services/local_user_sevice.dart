import 'package:projeto_ford/api/base_local_service.dart';
import 'package:projeto_ford/api/common/dtos/baseDTO.dart';
import 'package:projeto_ford/api/common/dtos/usertDTO.dart';

class LocalUserService extends BaseLocalService {
  @override
  Future<List<BaseDTO>> listAll() async {
    await super.openDb();

    final List<Map<String, dynamic>> usersMaps = await super.con.query('user');

    return List.generate(usersMaps.length, (index) {
      return UsertDTO(
        id: usersMaps[index]['id'],
        name: usersMaps[index]['name'],
        email: usersMaps[index]['email'],
        password: usersMaps[index]['password'],
      );
    });
  }

  @override
  Future<bool> insert(BaseDTO dto) async {
    late bool inserted = false;

    await super.openDb();
    await super
        .con
        .insert(
          'user',
          dto.toMap(),
        )
        .then(
          (id) => id != 0 ? inserted = true : inserted = false,
        );

    return inserted;
  }

  @override
  Future<bool> update(BaseDTO dto) async {
    bool updated = false;
    await super.openDb();

    await super.con.update(
      'user',
      dto.toMap(),
      where: 'id = ?',
      whereArgs: [dto.id],
    ).then(
      (changes) => changes != 0 ? updated = true : updated = false,
    );

    return updated;
  }

  @override
  Future<bool> delete(int id) async {
    bool deleted = false;

    await super.openDb();

    await super.con.delete(
      'user',
      where: 'id = ?',
      whereArgs: [id],
    ).then(
      (rowsDeleted) => rowsDeleted != 0 ? deleted = true : deleted = false,
    );

    return deleted;
  }
}
