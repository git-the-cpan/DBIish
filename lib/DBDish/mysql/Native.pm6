
use v6;

use NativeCall;

unit module DBDish::mysql::Native;

constant LIB = %*ENV<DBIISH_MYSQL_LIB> || 'mysqlclient';

#From mysql_com.h
enum mysql-field-type is export (
  MYSQL_TYPE_DECIMAL => 0, MYSQL_TYPE_TINY => 1,
  MYSQL_TYPE_SHORT => 2,  MYSQL_TYPE_LONG => 3,
  MYSQL_TYPE_FLOAT => 4,  MYSQL_TYPE_DOUBLE => 5,
  MYSQL_TYPE_NULL => 6,   MYSQL_TYPE_TIMESTAMP => 7,
  MYSQL_TYPE_LONGLONG => 8,MYSQL_TYPE_INT24 => 9,
  MYSQL_TYPE_DATE => 10,   MYSQL_TYPE_TIME => 11,
  MYSQL_TYPE_DATETIME => 12, MYSQL_TYPE_YEAR => 13,
  MYSQL_TYPE_NEWDATE => 14, MYSQL_TYPE_VARCHAR => 15,
  MYSQL_TYPE_BIT => 16,
  MYSQL_TYPE_NEWDECIMAL => 246,
  MYSQL_TYPE_ENUM => 247,
  MYSQL_TYPE_SET => 248,
  MYSQL_TYPE_TINY_BLOB => 249,
  MYSQL_TYPE_MEDIUM_BLOB => 250,
  MYSQL_TYPE_LONG_BLOB => 251,
  MYSQL_TYPE_BLOB => 252,
  MYSQL_TYPE_VAR_STRING => 253,
  MYSQL_TYPE_STRING => 254,
  MYSQL_TYPE_GEOMETRY => 255
);

constant %mysql-type-conv is export = (
  MYSQL_TYPE_DECIMAL.value => 'Num', MYSQL_TYPE_TINY.value => 'Int', #Tiny is used for Bool
  MYSQL_TYPE_SHORT.value => 'Int',  MYSQL_TYPE_LONG.value => 'Int',
  MYSQL_TYPE_FLOAT.value => 'Num',  MYSQL_TYPE_DOUBLE.value => 'Num',
  MYSQL_TYPE_NULL.value => 'Str',
  MYSQL_TYPE_TIMESTAMP.value => 'Int',
  MYSQL_TYPE_LONGLONG.value => 'Int', MYSQL_TYPE_INT24.value => 'Int',
  MYSQL_TYPE_DATE.value => 'Str',   MYSQL_TYPE_TIME.value => 'Str',
  MYSQL_TYPE_DATETIME.value => 'Str', MYSQL_TYPE_YEAR.value => 'Int',
  MYSQL_TYPE_NEWDATE.value => 'Str', MYSQL_TYPE_VARCHAR.value => 'Str',
  MYSQL_TYPE_BIT.value => 'Int',
  MYSQL_TYPE_NEWDECIMAL.value => 'Num',
  MYSQL_TYPE_ENUM.value => 'Str'
 # Meh the default will be Str
).hash;

class MYSQL_FIELD is repr('CStruct') is export {
    has	Str	$.name;
    has Str	$.org_name;
    has Str	$.table;
    has Str	$.org_table;
    has Str	$.db;
    has Str	$.catalog;
    has	Str	$.def;
    has ulong	$.length;
    has ulong	$.max_length;
    has uint32	$.name_length;
    has uint32	$.org_name_length;
    has uint32	$.table_length;
    has	uint32	$.org_table_length;
    has uint32	$.db_length;
    has uint32	$.catalog_length;
    has uint32	$.def_length;
    has uint32	$.flags;
    has uint32	$.decimals;
    has uint32	$.charsetnr;
    has int32	$.type;
    has Pointer $.extension;
}

#------------ mysql library functions in alphabetical order ------------

sub mysql_affected_rows( OpaquePointer $mysql_client )
    returns int32
    is native(LIB)
    is export
    { ... }

sub mysql_close( OpaquePointer $mysql_client )
    is native(LIB)
    is export
    { ... }

sub mysql_error( OpaquePointer $mysql_client)
    returns str
    is native(LIB)
    is export
    { ... }

sub mysql_fetch_field( OpaquePointer $result_set )
    returns Pointer[MYSQL_FIELD]
    is native(LIB)
    is export
    { ... }

sub mysql_fetch_row( OpaquePointer $result_set )
    returns CArray[Str]
    is native(LIB)
    is export
    { ... }

sub mysql_field_count( OpaquePointer $mysql_client )
    returns uint32
    is native(LIB)
    is export
    { ... }

sub mysql_free_result( OpaquePointer $result_set )
    is native(LIB)
    is export
    { ... }

sub mysql_init( OpaquePointer $mysql_client )
    returns OpaquePointer
    is native(LIB)
    is export
    { ... }

sub mysql_insert_id( OpaquePointer $mysql_client )
    returns uint64
    is native(LIB)
    is export
    { ... }

sub mysql_num_rows( OpaquePointer $result_set )
    returns ulonglong
    is native(LIB)
    is export
    { ... }

sub mysql_query( OpaquePointer $mysql_client, str $sql_command )
    returns int32
    is native(LIB)
    is export
    { ... }

sub mysql_real_connect( OpaquePointer $mysql_client, Str $host, Str $user,
    Str $password, Str $database, int32 $port, Str $socket, ulong $flag )
    returns OpaquePointer
    is native(LIB)
    is export
    { ... }

sub mysql_use_result( OpaquePointer $mysql_client )
    returns OpaquePointer
    is native(LIB)
    is export
    { ... }

sub mysql_warning_count( OpaquePointer $mysql_client )
    returns uint32
    is native(LIB)
    is export
    { ... }

sub mysql_stmt_init( OpaquePointer $mysql_client )
    returns OpaquePointer
    is native(LIB)
    is export
    { ... }

sub mysql_stmt_prepare( OpaquePointer $mysql_stmt, Str, ulong $length )
    returns OpaquePointer
    is native(LIB)
    is export
    { ... }

sub mysql_ping(OpaquePointer $mysql_client)
    returns int32
    is native(LIB)
    is export
    { ... }
