rails generate scaffold Application app_name:string description:string category:references price:money app_version:integer app_size:decimal status:string developer:references --no-migration

rails generate scaffold Category category_name:string description:string --no-migration

rails generate scaffold Developer  --no-migration

rails generate scaffold Download app:references person:references download_date:datetime --no-migration

rails generate scaffold Moderator  --no-migration

rails generate scaffold Person first_name:string last_name:string birth_date:date gender:string email:string balance:money --no-migration

rails generate scaffold PublicationRequest app:references moderator:references status:string request_date:datetime --no-migration

rails generate scaffold Report reason:string description:string app:references status:string person:references moderator:references --no-migration
