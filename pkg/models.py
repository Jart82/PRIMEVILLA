from datetime import datetime


from pkg import db

class State(db.Model):
    state_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    state_name = db.Column(db.String(100),nullable=False) 
    #set relationship
    lgas = db.relationship("Lga", back_populates="state_deets")
    state_prop = db.relationship("Property", back_populates="mystateprop_deets")

class Lga(db.Model):
    lga_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    lga_name = db.Column(db.String(200),nullable=False)
    #set the foreign key
    lga_stateid = db.Column(db.Integer, db.ForeignKey('state.state_id'))    
    #set relationships
    lga_prop = db.relationship("Property", back_populates="mylgaprop_deets")
    state_deets = db.relationship("State", back_populates="lgas")

class Prop_type(db.Model):
    prop_type_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    prop_type_name = db.Column(db.String(255),nullable=False)
    #set relationships
    prop_type_deets = db.relationship("Property", back_populates="prop_deets")


class Prop_images(db.Model):
    prop_images_id = db.Column(db.Integer, autoincrement=True,primary_key=True)
    image_file = db.Column(db.String(255),nullable=False) 
    #set foreign key
    property_id = db.Column(db.Integer, db.ForeignKey('property.property_id'))
    #set relationships
    prop_image_deets = db.relationship("Property", back_populates= "myprop_img")



class Property(db.Model):
    property_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    property_address = db.Column(db.String(255),nullable=False)
    number_of_rooms = db.Column(db.String(100),nullable= True)
    number_of_bathrooms = db.Column(db.String(100),nullable=True)
    prop_price = db.Column(db.String(50), nullable= True)
    status = db.Column(db.String(20), default = 'Available')
    date_added = db.Column(db.DateTime, default= datetime.utcnow)
    #set foreign keys
    prop_type_id = db.Column(db.Integer, db.ForeignKey('prop_type.prop_type_id'))
    state_id = db.Column(db.Integer, db.ForeignKey('state.state_id'))
    lga_id = db.Column(db.Integer, db.ForeignKey('lga.lga_id'))
    #set relationships
    mylgaprop_deets = db.relationship("Lga", back_populates= "lga_prop")
    mystateprop_deets = db.relationship("State", back_populates="state_prop")
    prop_deets = db.relationship("Prop_type", back_populates="prop_type_deets")
    myprop_img = db.relationship("Prop_images", back_populates = "prop_image_deets")




class Admin(db.Model):
    admin_id=db.Column(db.Integer, autoincrement=True,primary_key=True)
    admin_username=db.Column(db.String(20),nullable=True)
    admin_pwd=db.Column(db.String(255),nullable=True)

class Request(db.Model):
    request_id=db.Column(db.Integer, autoincrement=True,primary_key=True)
    request_name=db.Column(db.String(20),nullable=True)
    request_email=db.Column(db.String(20),nullable=True)
    request_subject=db.Column(db.String(100),nullable=True)
    request_content= db.Column(db.String(255),nullable=True)
