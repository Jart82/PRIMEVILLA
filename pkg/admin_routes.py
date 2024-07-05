import secrets,random, string, os, json, datetime
from functools import wraps
from flask import render_template, redirect, request, flash, session, url_for 
from werkzeug.security import generate_password_hash, check_password_hash
from pkg import app
from pkg.models import db, Admin, Property, Prop_images, Request

def login_required(f):
    @wraps(f)
    def check_login(*args,**kwargs):
        if session.get('adminonline') != None:
            return f(*args,**kwargs)
        else:
            flash('you must be logged in to access this page', category='error')
            return redirect ('/admin/')
    return check_login

@app.route("/admin/", methods=["GET", "POST"])
def admin_login():
    if request.method == "GET":
        return render_template("admin/admin_login.html")
    else:
        email = request.form.get("email")
        pwd = request.form.get("pwd")
        admin = db.session.query(Admin).filter(Admin.admin_username==email).first()
        if admin != None:
            stored_password = admin.admin_pwd
            chk = check_password_hash(stored_password, pwd)
            if chk:
                session['adminonline'] = admin.admin_id
                return redirect('/admin/admin_dashboard/')
            else:
                flash("Invalid password", category='error')
        else:
            flash("Invalid Username", category='error')
        return redirect(url_for('admin_login'))
    

@app.route("/logout/")
def admin_logout():
    if session.get('adminonline') != None:
        session.pop("adminonline")
        flash("You have been logged out...", category="success")
    return redirect("/admin/")

@app.route('/admin/admin_dashboard/', methods=["GET", "POST"])
@login_required
def admin_dashboard(): 
    propcount = db.session.query(Property).count()
    reqcount = db.session.query(Request).count()
    return render_template("admin/admin_dashboard.html", propcount= propcount, reqcount=reqcount)



@app.route('/admin_dashboard/addprop/', methods=["POST", "GET"])
@login_required
def addprop():
    if request.method == "POST":
        address = request.form.get("address")
        rooms = request.form.get("rooms")
        bathrooms = request.form.get("bathrooms")
        status = request.form.get("status")
        category = request.form.get("category")
        state = request.form.get("state")
        lga = request.form.get("lga")
        images = request.files.getlist("images")

        
        prop = Property(property_address=address, number_of_rooms=rooms, number_of_bathrooms=bathrooms, status=status, prop_type_id=category, state_id=state, lga_id=lga)
        db.session.add(prop)
        db.session.commit()

        for image in images:
            if image:
                actual_name = image.filename
                newname, ext = os.path.splitext(actual_name)
                newname = str(int(random.random()*100000000)) + ext
                image.save('pkg/static/uploads/' + newname)
                propimg = Prop_images(image_file=newname, property_id=prop.property_id)
                db.session.add(propimg)
                db.session.commit()

        flash("Property and images successfully added", category="success")
        return redirect("/admin_dashboard/addprop/")
    else:
        return render_template("admin/addprop.html")


@app.route("/admin_dashboard/request/", methods=["GET", "POST"])
@login_required
def proprequest(): 
    request = Request.query.all()

    return render_template("admin/requestlist.html", request=request)


