from backend.models.criterioDeuda_model import CriterioDeudaCreate, CriterioDeudaUpdate
from backend.database.supabase_client import get_supabase_client

class CriterioDeudaRepository:
    def __init__(self):
        self.table = "criterio_deuda"
        self.client = get_supabase_client

    def create(self, criterio: CriterioDeudaCreate):
        payload = criterio.model_dump(exclude_none=True)
        return self.client.table(self.table).insert(payload).execute().data[0]

    def get_by_id(self, criterio_id: int):
        return self.client.table(self.table).select("*").eq("id_criterio", criterio_id).execute().data

    def update(self, criterio_id: int, criterio: CriterioDeudaUpdate):
        payload = criterio.model_dump(exclude_none=True)
        return self.client.table(self.table).update(payload).eq("id_criterio", criterio_id).execute().data

    def delete(self, criterio_id: int):
        return self.client.table(self.table).delete().eq("id_criterio", criterio_id).execute().data
