unit Lancamentos;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, FMX.Graphics;

type
    TLancamento = class

    private

        Fconn: TFDConnection;
        Fdescricao: string;
        Fvalor: string;
        Fdata: TDateTime;
        Ficone: TBitmap;
        Fid_materia: Integer;
        Fcategoria: string;
        Findice_icone: integer;

    public

        constructor Create(conn: TFDConnection);
        property id_materia: Integer read Fid_materia write Fid_materia;
        property valor: string read Fvalor write Fvalor;
        property data: TDateTime read Fdata write Fdata;
        property descricao: string read Fdescricao write Fdescricao;
        property categoria: string read Fcategoria write Fcategoria;
        property icone: TBitmap read Ficone write Ficone;
        property indice_icone: integer read Findice_icone write Findice_icone;

        function ListarLancamento(qtd_result: integer; out erro: string): TFDQuery;
        function Inserir(out erro: string): Boolean;
        function Alterar(out erro: string): Boolean;
        function Excluir(out erro: string): Boolean;
end;

implementation

{ TLancamentos }

constructor TLancamento.Create(conn: TFDConnection);
begin
    Fconn := conn;
end;


function TLancamento.Inserir(out erro: string): Boolean;
var
    qry : TFDQuery;
begin
    // Valida��es

    if descricao = '' then
    begin
        erro := 'Informe o a descri��o da mat�ria ou conte�do que deseja adicionar!';
        Result := false;
        exit;
    end;


    try
        try
            qry := TFDQuery.Create(nil);
            qry.Connection := Fconn;

            with qry do
            begin
                Active := false;
                SQL.Clear;
                SQL.Add('INSERT INTO materias(categoria, valor, data, descricao, icone, indice_icone)');
                SQL.Add('VALUES(:categoria, :valor, :data, :descricao, :icone, :indice_icone)');
                ParamByName('categoria').Value := categoria;
                ParamByName('valor').Value := valor;
                ParamByName('data').Value := Fdata;
                ParamByName('descricao').Value := descricao;
                ParamByName('icone').Assign(icone);
                ParamByName('indice_icone').Value := indice_icone;
                ExecSQL;
            end;

            Result := true;
            erro := '';

        except on ex:exception do
        begin
            Result := False;
            erro := 'Erro ao inserir mat�ria! ' + ex.Message;
        end;
        end;

    finally
        qry.DisposeOf;
    end;
end;


function TLancamento.Alterar(out erro: string): Boolean;
var
    qry : TFDQuery;
begin
    // Validacoes...
    if id_materia <= 0 then
    begin
        erro := 'Informe a mat�ria ou conte�do!';
        Result := false;
        exit;
    end;

    if descricao = '' then
    begin
        erro := 'Informe o a descri��o da mat�ria ou conte�do que deseja alterar!';
        Result := false;
        exit;
    end;


    try
        try
            qry := TFDQuery.Create(nil);
            qry.Connection := Fconn;

            with qry do
            begin
                Active := false;
                SQL.Clear;
                SQL.Add('UPDATE materias SET categoria=:categoria, valor=:valor, data=:data, ');
                SQL.Add('descricao=:descricao, icone=:icone, indice_icone=:indice_icone');
                SQL.Add('WHERE id_materia = :id_materia');
                ParamByName('categoria').Value := categoria;
                ParamByName('valor').Value := valor;
                ParamByName('data').Value := Fdata;
                ParamByName('descricao').Value := descricao;
                ParamByName('icone').Assign(icone);
                ParamByName('indice_icone').Value := indice_icone;
                ExecSQL;
            end;

            Result := true;
            erro := '';

        except on ex:exception do
        begin
            Result := False;
            erro := 'Erro ao alterar mat�ria! ' + ex.Message;
        end;
        end;

    finally
        qry.DisposeOf;
    end;
end;


function TLancamento.Excluir(out erro: string): Boolean;
var
    qry : TFDQuery;
begin
    // Validacoes...
    if id_materia <= 0 then
    begin
        erro := 'Informe a mat�ria ou conte�do antes de excluir!';
        Result := false;
        exit;
    end;

    try
        try
            qry := TFDQuery.Create(nil);
            qry.Connection := Fconn;

            with qry do
            begin
                Active := false;
                SQL.Clear;
                SQL.Add('DELETE FROM materia');
                SQL.Add('WHERE id_materia = :id_materia');
                ParamByName('id_materia').Value := id_materia;
                ExecSQL;
            end;

            Result := true;
            erro := '';

        except on ex:exception do
        begin
            Result := False;
            erro := 'Erro ao excluir o materia: ' + ex.Message;
        end;
        end;

    finally
        qry.DisposeOf;
    end;
end;


function TLancamento.ListarLancamento(qtd_result: integer;
                                      out erro: string): TFDQuery;
var
    qry : TFDQuery;
begin
    try
        qry := TFDQuery.Create(nil);
        qry.Connection := Fconn;

        with qry do
        begin
            Active := false;
            sql.Clear;
            sql.Add('SELECT * FROM materias');
            sql.Add('WHERE 1 = 1');

            if id_materia > 0 then
            begin
                SQL.Add('AND id_materia = :id_materia');
                ParamByName('id_materia').Value := id_materia;
            end;

            sql.Add('ORDER BY descricao');

            Active := true;
        end;

        Result := qry;
        erro := '';

    except on ex:exception do
    begin
        Result := nil;
        erro := 'Erro ao consultar itens! ' + ex.Message;
    end;
    end;
end;

end.
