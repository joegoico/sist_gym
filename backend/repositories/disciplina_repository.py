from backend.database.supabase_client import get_supabase_client
from backend.models.disciplina_model import DisciplinaCreate, DisciplinaUpdate

class DisciplinaRepository:
    def __init__(self):
        self.supabase = get_supabase_client()
        self.table = 'disciplina'

    def get_by_id(self, disciplina_id: int):
        res = (self.supabase.table(self.table).select("*").eq("id_disciplina", disciplina_id).single().execute())
        return res.data

    def get_by_institucion(self, institucion_id: int):
        res = (self.supabase.table(self.table).select("*").eq("INSTITUCION_id_institucion", institucion_id).execute())
        print("info res.data: ", res.data)
        return res.data

    def create(self, disciplina: DisciplinaCreate):
        payload = disciplina.model_dump(by_alias=True)
        res = self.supabase.table(self.table).insert(payload).execute()
        return res.data

    def update(self, disciplina_id: int, disciplina: DisciplinaUpdate):
        payload = disciplina.model_dump(by_alias=True)
        res = (self.supabase.table(self.table).update(payload).eq("id_disciplina", disciplina_id).execute())
        return res.data

    def delete(self, disciplina_id: int):
        res = (self.supabase.table(self.table).delete().eq("id_disciplina", disciplina_id).execute())
        return res.data
